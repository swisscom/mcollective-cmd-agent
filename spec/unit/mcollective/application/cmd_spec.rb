require 'spec_helper'

module MCollective
  class Application
    describe 'Cmd' do
      before do
        application_file = File.join('lib/mcollective/application/cmd.rb')
        @app = MCollective::Test::ApplicationTest.new('cmd', :application_file => application_file).plugin

        client = mock
        client.stubs(:stats).returns(RPC::Stats.new)
        client.stubs(:progress=)
        @app.stubs(:rpcclient).returns(client)
        @app.stubs(:printrpc)
        @app.stubs(:printrpcstats)
        @app.stubs(:halt)
        @result_hash = {:statuscode => 0, :sender => 'rspec sender', :data => {}}
      end

      describe 'run_command' do
        it 'should run a simple command' do
          ARGV << 'echo "Hello World"'
          @result_hash[:data] = {
            :stderr   => '',
            :stdout   => 'Hello World',
            :success  => true,
            :exitcode => 0,
          }
          @app.rpcclient.expects(:run).returns([@result_hash])
          @app.send(:run_command)
        end
      end

      describe 'start_command' do
        it 'should run a simple command' do
          ARGV << 'echo "Hello World"'
          @result_hash[:data] = {:handle => 'abc123'}
          @app.rpcclient.expects(:start).returns([@result_hash])
          @app.send(:start_command)
        end
      end

      describe 'watch_command' do
        #it 'should run a simple command' do
        #  ARGV << 'abc123'
        #  @result_hash[:data] = {
        #    :jobs => {
        #      'abc123' => {
        #        :command => 'echo "Hello World"',
        #        :status  => 'running',
        #      }
        #    }
        #  }
        #  @app.rpcclient.expects(:list).returns([@result_hash])
        #  @app.send(:watch_command)
        #end
        pending
      end

      describe 'list_command' do
        #it 'should run a simple command' do
        #  @result_hash[:data] = {
        #    :jobs => {
        #      'abc123' => {
        #        :command => 'echo "Hello World"',
        #        :status  => 'running',
        #      }
        #    }
        #  }
        #  @app.rpcclient.expects(:list).returns([@result_hash])
        #  @app.send(:list_command)
        #end
        pending
      end

      describe 'kill_command' do
        it 'should run a simple command' do
          ARGV << 'abc123'

          @app.rpcclient.expects(:kill).returns([@result_hash])
          @app.send(:kill_command)
        end
      end

      describe 'cleanup_command' do
        it 'should run a simple command' do
          ARGV << 'abc123'
          @app.rpcclient.expects(:cleanup).returns([@result_hash])
          @app.send(:cleanup_command)
        end
      end
    end
  end
end
